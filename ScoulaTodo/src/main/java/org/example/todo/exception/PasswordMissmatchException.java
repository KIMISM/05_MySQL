package org.example.todo.exception;

public class PasswordMissmatchException extends Exception{
    public PasswordMissmatchException() {
        super("비밀전호가 맞지 않습니다.");
    }
}
