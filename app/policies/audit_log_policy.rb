class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end

  def confirm?
    return true if record.user_id = user.id
  end

  private

  def admin?
    admin_types.include?(user.type)
  end
end