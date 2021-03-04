class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key
  require 'json'

  def check
  end

  def serve_mp3
    audio_file_name = params[:fileName]
    file_path = File.join Rails.root, "app", "assets", "audio", audio_file_name
    if File.exists? file_path
      send_file file_path, :type=>"audio/mp3", :filename => audio_file_name
    else
      render json: JSON.generate({connection: "ERROR", message: "File not found!"})
    end
  end

  private

  def check_api_key
    sent_api_key = params[:apiKey]
    set_api_key = "1e33b256f3c87808310d231945e7c178"
    if sent_api_key == set_api_key
      return true
    else
      render json: JSON.generate({connection: "ERROR", message: "Wrong API key!"})
    end
  end
end
