package runner;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(plugin = {"pretty"},strict = false,features = "src/test/java/features/ngauge.feature",tags = {"@API"},monochrome = false)
public class APITest {
}
