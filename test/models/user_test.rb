require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @tenant = tenants(:one)
    @user = User.new(email: "test@example.com", password: "password", tenant: @tenant)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should have a tenant" do
    @user.tenant = nil
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should be unique per tenant" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
    assert_includes @user.errors[:password], "can't be blank"
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
    assert_includes @user.errors[:password], "is too short (minimum is 6 characters)"
  end
end
