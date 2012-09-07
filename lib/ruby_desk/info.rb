# A provider in oDesk.
# <p>There is a TON&nbsp;of info returned here and the best way to see what this actually means is to try pulling data from a few providers and match up the fields, most of the response fields are human readable. Here is some aditional info that should help decipher this response:</p>
# 
# <p>&nbsp;</p>
# <ul>
# <li>&lt;dev_userid&gt;scoopwilson&lt;/dev_userid&gt; The odesk users id of the provider</li>
# <li>&lt;dev_rank_percentile&gt;82&lt;/dev_rank_percentile&gt; The providers rank overall on oDesk</li>
# <li>&lt;dev_usr_score&gt;4.9681818181818&lt;/dev_usr_score&gt; The providers feedback score</li>
# 
# <li>&lt;dev_profile_access&gt;public&lt;/dev_profile_access&gt; The status of the providers profile (public or private)</li>
# <li>&lt;skill&gt; The Skill tag describes a skill that the provider has listed in their profile</li>
# <li>&lt;tsexam&gt; tsexam describes a test that the provider has taken and made public.</li>
# <li>&lt;dev_score&gt; dev_score describes feedback that the provider has received after a job has been completed (or just closed)</li>
# 
# <li>&lt;dev_recent_rank_percentile&gt;80&lt;/dev_recent_rank_percentile&gt; The providers rank on oDesk using data from the last 90 days.</li>
# <li>&lt;dev_active_interviews&gt;0&lt;/dev_active_interviews&gt; How many active interviews the provider is engaged in now.</li>
# <li>&lt;dev_total_hours&gt;2526.1666666667&lt;/dev_total_hours&gt; The providers total hours worked on oDesk.</li>
# 
# <li>&lt;experience&gt; Describes the providers experience as listed in their profile under the Experience section</li>
# <li>&lt;assignment&gt; Describes past assignements that are publicly viewable.</li>
#
# Here's a full list of all attributes available:
# * affiliated
# * ag_active_assignments
# * ag_adj_score
# * ag_adj_score_recent
# * ag_billed_assignments
# * ag_city
# * ag_cny_recno
# * ag_country
# * ag_country_tz
# * ag_description
# * ag_hours_lastdays
# * ag_last_date_worked
# * ag_logo
# * ag_manager_blurb
# * ag_manager_name
# * ag_member_since
# * ag_name
# * ag_portrait
# * ag_rank_percentile
# * ag_recent_hours
# * ag_summary
# * ag_teamid
# * ag_teamid_rollup
# * ag_tot_feedback
# * ag_total_developers
# * ag_total_hours
# * agency_ciphertext
# * assignments
# * assignments_count
# * candidacies
# * certification
# * ciphertext
# * competencies
# * dev_ac_agencies
# * dev_active_interviews
# * dev_adj_score
# * dev_adj_score_recent
# * dev_agency_ciphertext
# * dev_agency_ref
# * dev_availability
# * dev_bill_rate
# * dev_billed_assignments
# * dev_billed_assignments_recent
# * dev_blurb
# * dev_blurb_short
# * dev_category
# * dev_city
# * dev_country
# * dev_cur_assignments
# * dev_eng_skill
# * dev_est_availability
# * dev_expose_full_name
# * dev_full_name
# * dev_groups
# * dev_ic
# * dev_is_affiliated
# * dev_is_ready
# * dev_last_activity
# * dev_last_worked
# * dev_location
# * dev_member_since
# * dev_pay_agency_rate
# * dev_pay_rate
# * dev_portfolio_items_count
# * dev_portrait
# * dev_profile_title
# * dev_rank_percentile
# * dev_recent_hours
# * dev_recent_rank_percentile
# * dev_recno
# * dev_region
# * dev_scores
# * dev_short_name
# * dev_test_passed_count
# * dev_timezone
# * dev_tot_feedback
# * dev_tot_feedback_recent
# * dev_total_assignments
# * dev_total_hours
# * dev_total_hours_rounded
# * dev_ui_profile_access
# * dev_usr_score
# * dev_year_exp
# * education
# * experiences
# * favorited
# * iinitialize
# * is_odesk_ready
# * job_categories
# * oth_experiences
# * permalink
# * portfolio_items
# * profile_title_full
# * provider_profile_api
# * response_time
# * search_affiliate_providers_url
# * skills
# * trends
# * tsexams
# * tsexams_count
# * version
class RubyDesk::Info < RubyDesk::OdeskEntity

  attributes :profile_url, :portrait_50_img, :portrait_32_img, :ref

  class << self


    # Retrieves the profile with the given user
    # * connector: The RubyDesk::Connector that is connected to oDesk
    # * id: The id of the user to retrieve his profile
    # * options: A hash of options
    #   * brief: set this to true to retrieve only a brief profile of the given user
    def get_my_info(connector, id, options={})
      json = connector.prepare_and_invoke_api_call("auth/v1/info",
                                                   :method=>:get)
      return self.new(json['info'])
    end
  end

  def initialize(params={})
    params.each do |k, v|
      self.instance_variable_set("@#{k}", v)
    end
  end
end

