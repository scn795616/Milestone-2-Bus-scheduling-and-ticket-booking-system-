package com.crimsonlogic.busbookingsystem.util;

import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.id.Configurable;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.type.Type;

import java.io.Serializable;
import java.security.SecureRandom;
import java.util.Properties;


public class CustomPrefixIdentifierGenerator implements IdentifierGenerator, Configurable {
    private String prefix;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int LENGTH = 10;
    private static final SecureRandom RANDOM = new SecureRandom();

    @Override
    public void configure(Type type, Properties params, ServiceRegistry serviceRegistry) {
        prefix = params.getProperty("prefix");
    }

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) {
        String uniqueID = generateUniqueString();
        return prefix + uniqueID;
    }

    private String generateUniqueString() {
        StringBuilder sb = new StringBuilder(LENGTH);
        for (int i = 0; i < LENGTH; i++) {
            sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }
}
