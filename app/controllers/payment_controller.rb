class PaymentController < ApplicationController
  before_action :authenticate_user!

  def index
    @user=current_user.email
  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email})
        #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
        current_user.update(:stripe_id => customer.id)
        #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      card_token = params[:stripeToken]
      #it's the stripeToken that we added in the hidden input
      if card_token.nil?
        format.html { redirect_to payment_path, error: "Oops"}
      end
      #checking if a card was giving.

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      #we're attaching the card to the stripe customer
      customer.save

      format.html { redirect_to success_path }
    end
  end

  def success
    @plans = Stripe::Plan.list.data
  end


  def subscribe
      if current_user.stripe_id.nil?
        redirect_to success_path, :flash => {:error => 'First, you need to enter your card'}
        return
      end

      customer = Stripe::Customer.new current_user.stripe_id

      subscriptions = Stripe::Subscription.list(customer: customer.id)
      subscriptions.each do |subscription|
        subscription.delete
      end

      plan_id = params[:plan_id]
      subscription = Stripe::Subscription.create({
                                                     customer: customer,
                                                     items: [{plan: plan_id}], })

      subscription.save
      redirect_to success_path
  end

end
