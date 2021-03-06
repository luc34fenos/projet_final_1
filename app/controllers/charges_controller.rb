class ChargesController < ApplicationController

	before_action :authorize 
	@@amount = 0

	def new
		@amount = @@amount = params[:montant].nil? ? 5 : params[:montant] 
	end

	def create
	  # Amount in cents
	  @amount = @@amount

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end
