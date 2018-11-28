class ChargesController < ApplicationController

	before_action :authorize 

	def new
		
	end

	def create
	  # Amount in cents
	  
	  puts params[:montant]
	  @amount = params[:montant].nil? ? 5 : params[:montant]

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
