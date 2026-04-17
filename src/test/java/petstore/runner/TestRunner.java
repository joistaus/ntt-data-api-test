package petstore.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestRunner {
    @Test
    public void testAll() {
        Results results = Runner.path("classpath:petstore/pet/pet.feature")
                .outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount());
    }
}
