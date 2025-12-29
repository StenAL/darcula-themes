package com.example;

import java.util.List;
import java.util.ArrayList;
import static java.lang.Math.PI;
import static com.example.Constants.MAX_VALUE;

/**
 * Example Java class demonstrating theme scopes.
 * @see java.util.List
 * @author Test
 */
@SuppressWarnings("unused")
public class Example<T> extends BaseClass implements Runnable {

    public static final int CONSTANT = 100;
    private static String staticField = "static";
    private String instanceField;
    private List<T> items;

    public Example(String name) {
        this.instanceField = name;
        this.items = new ArrayList<>();
    }

    @Override
    public void run() {
        // Line comment
        int localVar = 42;
        String text = "Hello\nWorld";
        double pi = PI;

        if (localVar > MAX_VALUE) {
            System.out.println(text);
        }

        /* Block comment */
        items.forEach(item -> {
            process(item);
        });

        switch (localVar) {
            case CONSTANT -> doSomething();
            default -> doNothing();
        }
    }

    private void process(T item) {
        boolean isNull = item == null;
        this.instanceField = item != null ? item.toString() : "null";
    }

    private void doSomething() {}
    private void doNothing() {}

    public enum Status {
        ACTIVE, INACTIVE, PENDING
    }
}

class BaseClass {}
