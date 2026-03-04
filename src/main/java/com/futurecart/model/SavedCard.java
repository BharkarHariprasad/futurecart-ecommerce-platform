package com.futurecart.model;

public class SavedCard {

    private int cardId;
    private int userId;
    private String cardNumber;
    private String CardName;
    private int expiryMonth;
    private int expiryYear;
    
    public SavedCard() {
    	
    }
    
    public SavedCard(int cardId, int userId, String cardNumber, String CardName, int expiryMonth, int expiryYear) {
		this.cardId = cardId;
		this.userId = userId;
		this.cardNumber = cardNumber;
		this.CardName = CardName;
		this.expiryMonth = expiryMonth;
		this.expiryYear = expiryYear;
	}

	public int getCardId() { return cardId; }
    public void setCardId(int cardId) { this.cardId = cardId; }

    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public int getExpiryMonth() { return expiryMonth; }
    public void setExpiryMonth(int expiryMonth) { this.expiryMonth = expiryMonth; }

    public int getExpiryYear() { return expiryYear; }
    public void setExpiryYear(int expiryYear) { this.expiryYear = expiryYear; }

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getCardName() {
		return CardName;
	}

	public void setCardName(String cardName) {
		CardName = cardName;
	}

	public String getMaskedNumber() {
	    if (cardNumber == null || cardNumber.length() < 4) {
	        return "****";
	    }
	    return "•••• •••• •••• " + cardNumber.substring(cardNumber.length() - 4);
	}
    
    
}