/**
 * Describe Picalculationjs here.
 *
 * The exported method is the entry point for your code when the function is invoked. 
 *
 * Following parameters are pre-configured and provided to your function on execution: 
 * @param event: represents the data associated with the occurrence of an event, and  
 *                 supporting metadata about the source of that occurrence.
 * @param context: represents the connection to Functions and your Salesforce org.
 * @param logger: logging handler used to capture application logs and trace specifically
 *                 to a given execution of a function.
 */
 
export default async function (event, context, logger) {
    function calcPi(iter){
        let successCount = 0;		
		for (let i = 0; i <= iter; i++ ){
        	let x = Math.random();
        	let y = Math.random();
        	if ((Math.pow(x, 2) + Math.pow(y, 2)) <= 1){
           	 	successCount = successCount + 1;
        	}
	    }
		return (4* successCount) / iter;
	}

    const data = event.data || {};
    logger.info(`Invoking Picalculationjs with payload ${JSON.stringify(data)}`);

    // validate the payload params
    if (!data.jobId || !data.decimalsNumber) {
        throw new Error(`Please provide JobId and DecimalsNumber`);
    }
    // retrieve values from payload
    const decimalsNumber = data.decimalsNumber;
    const jobId = data.jobId;
    logger.info("Value Received : DecimalNumbers {}" , decimalsNumber);
    logger.info("Value Received : JobId {}" , jobId);
    // calculate pi
    const results = calcPi(decimalsNumber);
    logger.info("Value Calculated {}" , results);
    return results;
    

}
