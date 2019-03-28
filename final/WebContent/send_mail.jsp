/**
 * This call sends an email to one recipient, using a validated sender address
 * Do not forget to update the sender address used in the sample
 */
package MyClass;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.resource.Email;
import org.json.JSONArray;
import org.json.JSONObject;
public class MyClass {
    public static void main(String[] args) throws MailjetException, MailjetSocketTimeoutException {
      MailjetClient client;
      MailjetRequest request;
      MailjetResponse response;
      client = new MailjetClient("api key", "api secret");
      request = new MailjetRequest(Email.resource)
                        .property(Email.FROMEMAIL, "pilot@mailjet.com")
                        .property(Email.FROMNAME, "Mailjet Pilot")
                        .property(Email.SUBJECT, "Your email flight plan!")
                        .property(Email.TEXTPART, "Dear passenger, welcome to Mailjet! May the delivery force be with you!")
                        .property(Email.HTMLPART, "Dear passenger, welcome to Mailjet!May the delivery force be with you!")
                        .property(Email.RECIPIENTS, new JSONArray()
                .put(new JSONObject()
                    .put("Email", "passenger@mailjet.com")));
      response = client.post(request);
      System.out.println(response.getData());
    }
}
