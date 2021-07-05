public with sharing class invokePicalculation {
    public static void test() {
        System.debug('Invoking myfunction');

        functions.Function myFunction = functions.Function.get('functionstest.picalculation');
        functions.FunctionInvocation invocation = myFunction.invoke('{"decimalsNumber" : 500000000}');
        String jsonResponse = invocation.getResponse();

        System.debug('Response from myfunction ' + jsonResponse);
    }
}
    