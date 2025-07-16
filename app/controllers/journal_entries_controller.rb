class JournalEntriesController < ApplicationController
  before_action :authorize
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  def index
    @journal_entries = current_user.tenant.journal_entries
  end

  def show
  end

  def new
    @journal_entry = current_user.tenant.journal_entries.build
  end

  def create
    @journal_entry = current_user.tenant.journal_entries.build(journal_entry_params)
    if @journal_entry.save
      redirect_to journal_entries_path, notice: 'Journal entry was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @journal_entry.update(journal_entry_params)
      redirect_to journal_entries_path, notice: 'Journal entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @journal_entry.destroy
    redirect_to journal_entries_path, notice: 'Journal entry was successfully destroyed.'
  end

  private

  def set_journal_entry
    @journal_entry = current_user.tenant.journal_entries.find(params[:id])
  end

  def journal_entry_params
    params.require(:journal_entry).permit(:date, :description, journal_entry_items_attributes: [:id, :account_id, :entry_type, :amount, :_destroy])
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
