class GenerateLeadsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    Lead.create!(person_lead_params)
  end

  def admin
    insurance_count = Lead.get_insurance_count
    @insurance_map = insurance_count['poll_options'].map do |insurance|
      { name: insurance['content'], count: insurance['total_count'] }
    end
    main_convos = Lead.get_all_convo['results']
    @convos = main_convos.pluck('name', 'email', 'phone_number','contact_id')
    # Leads.create!(name: @convos[0], email: @convos[1], phone_number: @convos[2], contact_id: @convos[3])
    # contact_ids = main_convos.pluck('contact_id')
    # answers = contact_ids.map do |contact_id|
    #   Lead.get_answers(contact_id: contact_id)
    # end
    # answers
  end

  def get_contact_details
    qa = JSON.parse(Lead.get_answers(contact_id: params[:contact_id]))
    full_qa_data = qa['answers'].pluck('question_id', 'poll_option_content', 'input_text')
    
    @qa_data = full_qa_data.map do |question_id, poll_option_content, input_text|
      question_details = Lead.get_question(question_id: question_id)
      { question: question_details['transcription'],
        answer: poll_option_content.present? ? poll_option_content : input_text,
        available_options: question_details['poll_options'].present? ? question_details['poll_options'].pluck('content') : []}
    end

  end

  private

  # def person_lead_params
  #   params.require(:person_lead).permit(:person_name, :platform, :data)
  # end
end