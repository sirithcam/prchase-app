class Api::PurchaseIntentsController < ApplicationController
  before_action :validate_payment_data, only: [:create]

  def index
    @purchase_intents = PurchaseIntent.all
    render json: @purchase_intents, status: :ok
  end

  def create
    @purchase_intent = PurchaseIntent.new(purchase_intent_params)

    @purchase_intent.status = 'pending' # Set initial status
    @purchase_intent.token = SecureRandom.uuid # Generate token

    if @purchase_intent.save
      render json: { token: @purchase_intent.token }, status: :created
    else
      render json: { errors: @purchase_intent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @purchase_intent.destroy
      head :no_content
    else
      render json: { errors: @purchase_intent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def purchase_intent_params
    params.require(:purchase_intent).permit(:user_id, :book_id, :price, :currency, :payment_method, :purchase_id)
  end

  def validate_payment_data
    valid_currencies = %w[PLN USD EUR]
    valid_payment_methods = %w[credit_card paypal cash]

    currency = params.dig(:purchase_intent, :currency)
    payment_method = params.dig(:purchase_intent, :payment_method)

    unless valid_currencies.include?(currency) && valid_payment_methods.include?(payment_method)
      render json: { error: 'Invalid currency or payment method' }, status: :unprocessable_entity
    end
  end
end
