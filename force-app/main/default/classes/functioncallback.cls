public with sharing class functioncallback {
    public static void performCall() {
        functions.Function myFunction = functions.Function.get('functionstest.picalculation');
        // Pass a callback to Function.invoke to perform an asynchronous invocation.
        functions.FunctionInvocation invocation = myFunction.invoke('{"decimalsNumber" :  1000000000}', new DemoCallback());
    }

    public class DemoCallback implements functions.FunctionCallback {
        public void handleResponse(functions.FunctionInvocation result) {
            // Handle result of function invocation
            String jsonResponse = result.getResponse();
            System.debug('Got response ' + jsonResponse);
        }
    }

}

