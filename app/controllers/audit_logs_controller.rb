class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.includes(:user)
    authorize @audit_logs
  end
end
