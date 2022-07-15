class UploadfileController < ApplicationController
require 'csv'

  def index
    
    @file = params[:file]
   
    csv = CSV.parse('@file', :headers => true)
    csv.each do |row|
     temp << row.to_hash
      LastSingedInJob.perform(temp)
    end
  end
end
