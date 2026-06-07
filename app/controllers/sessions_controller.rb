# frozen_string_literal: true

class SessionsController < ApplicationController
  def sign_in
    session = Auth::SignInService.new(sign_in_params[:email], sign_in_params[:password]).call

    if session.success?
      render json: session.result, status: :ok
    else
      render json: session.error, status: :unauthorized
    end
  end

  def sign_out
    session = Auth::SignOutService.new(sign_out_params[:refresh_token]).call

    if session.success?
      head :no_content
    else
      render json: session.error, status: :unauthorized
    end
  end

  def refresh
    session = Auth::RefreshService.new(refresh_params[:refresh_token]).call

    if session.success?
      render json: session.result, status: :ok
    else
      render json: session.error, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.permit(:email, :password)
  end

  def sign_out_params
    params.permit(:refresh_token)
  end

  def refresh_params
    params.permit(:refresh_token)
  end
end
