class MembersController < ApplicationController
  before_action :set_member, only: %i[ show update destroy ]

  # GET /members
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if Member.new_member?(params[:name])
      if @member.save
        Membership.check_membership(@member.id, params[:library_id])
        render json: @member, status: :created, location: @member
      else
        render json: @member.errors, status: :unprocessable_entity
      end
    else
      # look for member
      member = Member.find_by_name(params[:name])
      Membership.check_membership(member.id, params[:library_id])
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:name, :card_number, :expiration_date, :cvv, :library_id)
    end
end
