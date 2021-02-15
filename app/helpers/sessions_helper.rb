module SessionsHelper

    def log_in(user)
        session[:relationship_officer_id] = user.id
    end

    def current_user
        @current_user ||= RelationshipOfficer.find_by(id: session[:relationship_officer_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete[:relationship_officer_id]
        @current_user = nil
    end
end
