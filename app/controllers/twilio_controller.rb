require 'twilio-ruby'

class TwilioController < ApplicationController
	include Webhookable

	after_filter :set_header

	skip_before_action :verify_authenticity_token

	def voice
		response = Twilio::TwiML::Response.new do |r|
			r.Say 'Hey there, congrats on integrating Twilio into Rails 4'
			r.Play 'http://linode.rabasa.com/cantinat.mp3', :voice => 'alice'
		end
		
		render_twiml response	
	end	
end