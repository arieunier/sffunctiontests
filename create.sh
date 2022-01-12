#/bin/sh

ALIASORG=FunctionsScratchOrg
COMPUTEENV=FunctionsComputeEnv

sfdx force:org:create -s -f config/project-scratch-def.json -a  $ALIASORG -v FunctionsOrg --durationdays 30
read -p "Press [Enter] to move to next part"

sf env create compute --connected-org=$ALIASORG --alias $COMPUTEENV
read -p "Press [Enter] to move to next part"

git commit -am 'commit before push'
sf deploy functions --connected-org=$ALIASORG
read -p "Press [Enter] to move to next part"

sfdx force:source:push -f -u $ALIASORG
read -p "Press [Enter] to move to next part"

sfdx force:user:permset:assign -n FunctionsRecipes -u $ALIASORG
sfdx force:user:permset:assign -n Functions -u $ALIASORG
read -p "Press [Enter] to move to next part"


sfdx force:org:open -p "/lightning/n/Functions" -u $ALIASORG
sfdx force:org:open -p "/lightning/setup/ThemingAndBranding/home" -u $ALIASORG