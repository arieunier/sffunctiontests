# APEX DEFAULT CODE TO INVOKE A FUNCTION

Integer nbLoop = 10;
Integer nbDecimals = 100000;

System.debug('Starting Test');
for (Integer i = 0; i < nbLoop; i++) 
{
    System.debug('########### Invoking myfunction : ' + i);
    functions.Function myFunction = functions.Function.get('functionstest.picalculation');
    functions.FunctionInvocation invocation = myFunction.invoke('{"decimalsNumber" : ' + nbDecimals + '}');
    String jsonResponse = invocation.getResponse();
    System.debug('Response from myfunction ' + jsonResponse);
    System.debug('########### Ending myfunction : ' + i);
}


# SAME WITH NODE 
functions.Function myFunction = functions.Function.get('functionstest.cloudarchitects');
functions.FunctionInvocation invocation = myFunction.invoke('{"decimalsNumber" : 10}');
String jsonResponse = invocation.getResponse();
System.debug('Response from myfunction ' + jsonResponse);
 

# callback
functioncallback.performCall(); 
#

SELECT STATUS,FUNCTIONSACCOUNTNAME,FUNCTIONSACCOUNTLOGINORG  FROM SfFunctionsConnection

SELECT FIELDS(ALL) from FunctionInvocationRequest  ORDER BY CreatedDate DESC LIMIT 100