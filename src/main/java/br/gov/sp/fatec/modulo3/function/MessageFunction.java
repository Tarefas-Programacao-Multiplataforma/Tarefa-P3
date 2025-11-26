package br.gov.sp.fatec.modulo3.function;

import br.gov.sp.fatec.modulo3.function.dto.Message;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.function.Consumer;

@Component
public class MessageFunction {

    @Bean
    public Consumer<Message> messageConsumer() {
        return message -> {
            System.out.println("A mensagem chegou: " + message.value());
        };
    }
}
