package com.firsttest.trialproject;

import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.mobile.client.AWSMobileClient;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferListener;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferObserver;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferState;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferUtility;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.firsttest.trialproject.Constants.*;

import java.io.File;
import java.util.Map;

import static com.firsttest.trialproject.Constants.BUCKET_NAME;
import static com.firsttest.trialproject.Constants.KEY;
import static com.firsttest.trialproject.Constants.SECRET;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/aws_upload";
    File image_file;
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, final MethodChannel.Result result) {
                  final Map<String,Object> arguments = methodCall.arguments();
                  if(methodCall.method.equals("upload_aws")) {

                      String files = (String) arguments.get("file");

                      Log.d("testing1",files);

                      ClientConfiguration configuration = new ClientConfiguration();
                      configuration.setMaxErrorRetry(3);
                      configuration.setConnectionTimeout(501000);
                      configuration.setSocketTimeout(501000);
                      configuration.setProtocol(Protocol.HTTP);

                      BasicAWSCredentials credentials = new BasicAWSCredentials(KEY, SECRET);
                      AmazonS3Client s3Client = new AmazonS3Client(credentials,configuration);
                      s3Client.setRegion(Region.getRegion(Regions.US_EAST_1));
                      TransferUtility transferUtility =
                              TransferUtility.builder().defaultBucket(BUCKET_NAME)
                                      .context(getApplicationContext())
                                      .awsConfiguration(AWSMobileClient.getInstance().getConfiguration())
                                      .s3Client(s3Client)
                                      .build();

                      Log.d("testing2",s3Client.getRegionName());

                      TransferObserver uploadObserver =
                              transferUtility.upload("images/" + new File(files).getName(), new File(files));



                      uploadObserver.setTransferListener(new TransferListener() {

                          @Override
                          public void onStateChanged(int id, TransferState state) {
                              if (TransferState.COMPLETED == state) {
                                  result.success("Uploaded");
                                  Log.d("sucess","Uploaded");
                                  Log.d("sucess", "Uploaded");

                              }
                          }

                          @Override
                          public void onProgressChanged(int id, long bytesCurrent, long bytesTotal) {
                              float percentDonef = ((float)bytesCurrent/(float)bytesTotal) * 100;
                              int percentDone = (int)percentDonef;

                          }

                          @Override
                          public void onError(int id, Exception ex) {
                              // Handle errors
                              Log.d("error",ex.toString());
                          }

                      });

                      // If your upload does not trigger the onStateChanged method inside your
                      // TransferListener, you can directly check the transfer state as shown here.
                      if (TransferState.COMPLETED == uploadObserver.getState()) {
                          result.success("Uploaded");
                          Log.d("sucess", uploadObserver.getAbsoluteFilePath());
                      }
                      Log.d("testing3",files);
                      Log.d("testing4",uploadObserver.getState().toString());
                      Log.d("sucess1", s3Client.getUrl(BUCKET_NAME,new File(files).getName()).toString());

                  }
              }
            }
    );
  }
}
