package hello;

import hello.models.Automation;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@SpringBootApplication
@RestController
public class Application {

    @RequestMapping("/")
    @ResponseBody
    public Automation home() {
        Automation automate = new Automation();
        Instant timestamp = Instant.now();
        automate.setTimestamp(timestamp.getEpochSecond());
        automate.setMessage("Yass Girll Yass");
        return automate;

    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}