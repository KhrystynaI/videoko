class Spree::UsersController < Spree::StoreController
  before_action :set_current_order, except: :show
  prepend_before_action :load_object, only: [:show, :edit, :update]
  prepend_before_action :authorize_actions, only: :new

  include Spree::Core::ControllerHelpers

  def show
    @orders = @user.orders.complete.order('completed_at desc')
    curr_page = params[:page] || 1
            @offers_uncomplete = @user.offers.where(status: "uncomplete").page(curr_page).per(5)
            @offers_complete = @user.offers.where(status: "complete").page(curr_page).per(5)
  end

  def create
    @user = Spree.user_class.new(user_params)
    if @user.save

      if current_order
        session[:guest_token] = nil
      end

      redirect_back_or_default(root_url)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      if params[:user][:password].present?
        # this logic needed b/c devise wants to log us out after password changes
        Spree.user_class.reset_password_by_token(params[:user])
        if Spree::Auth::Config[:signout_after_password_change]
          sign_in(@user, event: :authentication)
        else
          bypass_sign_in(@user)
        end
      end
      redirect_to spree.account_path, notice: Spree.t(:account_updated)
    else
      render :edit
    end
  end

  def confirm_email
    user = Spree::User.find_by(confirmation_token: params[:id])
    if user
      user.update!(confirmed_at: Time.now, confirmation_token: nil)

      flash[:success] = "Дякуємо, акаунт підтверджено"
      redirect_to spree.account_path(user)
    else
      flash[:error] = "Вибачте, такого користувача не існує"
      redirect_to root_url
  end
end

  private

  def user_params
    params.require(:user).permit(Spree::PermittedAttributes.user_attributes)
  end

  def load_object
    @user ||= spree_current_user
    authorize! params[:action].to_sym, @user
  end

  def authorize_actions
    authorize! params[:action].to_sym, Spree.user_class.new
  end

  def accurate_title
    Spree.t(:my_account)
  end
end
