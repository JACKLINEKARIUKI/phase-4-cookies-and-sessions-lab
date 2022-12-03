class SessionsController < ApplicationController

    def index
        session[:page_views] ||= 0
        cookies[:page_views] ||= 0

        if session[:page_views] < 3
            session[:page_views] += 1
            cookies[:page_views] = cookies[:page_views].to_i + 1
            render json: { session: session[:page_views], cookies: cookies[:page_views], message: "You have visited this page #{cookies[:page_views]} times." }
        else
            render json: {message: "You have visited this page #{cookies[:page_views]} times. You have reached the limit of 3 visits."}
        end
    end
    
end
