# frozen_string_literal: true

require 'dotenv/load'
require 'sinatra'
require 'workos'

get '/' do
  @directories = WorkOS::DirectorySync.list_directories

  erb :index
end

get '/directories/:id' do
  @groups = WorkOS::DirectorySync.list_groups(directory: params[:id])
  @users = WorkOS::DirectorySync.list_users(directory: params[:id])

  erb :directory
end
