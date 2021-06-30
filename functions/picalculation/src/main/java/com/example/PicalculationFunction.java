package com.example;

import com.salesforce.functions.jvm.sdk.Context;
import com.salesforce.functions.jvm.sdk.InvocationEvent;
import com.salesforce.functions.jvm.sdk.SalesforceFunction;
import com.salesforce.functions.jvm.sdk.data.Record;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.lang.Math;

/**
 * Describe PicalculationFunction here.
 */
public class PicalculationFunction implements SalesforceFunction<FunctionInput, FunctionOutput> {
  private static final Logger LOGGER = LoggerFactory.getLogger(PicalculationFunction.class);

  private static Double calcPi(final Double iterations){
    Double x;
    Double y;
    Double successCount = 0.0;
    for (Double i = 0.0; i <= iterations; i = i + 1.0){
        x = Math.random();
        y = Math.random();
        if ((Math.pow(x, 2) + Math.pow(y, 2)) <= 1){
            successCount = successCount + 1.0;
        }
    }
  return (Double) (4 * successCount) / iterations;
}

  @Override
  public FunctionOutput apply(InvocationEvent<FunctionInput> event, Context context)
      throws Exception {

    String returnValue = "1.0";
    LOGGER.info("Function is called");

    Double decimalsNumbers = event.getData().getDecimalsNumber();
    
    LOGGER.info("Value Received {}" , decimalsNumbers);
    Double sum = calcPi(decimalsNumbers);
    //for(int counter=1;counter<decimalsNumbers;counter++){
    //  sum += Math.pow(-1,counter + 1)/((2*counter) - 1);
    //}
    LOGGER.info("Value Calculated {}" , sum);
    return new FunctionOutput(sum.toString());
    /*
    List<Record> records =
        context.getOrg().get().getDataApi().query("SELECT Id, Name FROM Account").getRecords();

    LOGGER.info("Function successfully queried {} account records!", records.size());

    List<Account> accounts = new ArrayList<>();
    for (Record record : records) {
      String id = record.getStringField("Id").get();
      String name = record.getStringField("Name").get();

      accounts.add(new Account(id, name));
    }

    return new FunctionOutput(accounts);
    */

  }
}
