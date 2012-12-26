module NerdFactsHelper

  def nerd_facts_box_for(type, &block)
    content_tag :div, id: "#{type.downcase.tr(" ", "_")}", class: "fact-highscore-list thumbnail rightmost" do
      yield type, block
    end
  end

  def popover_title(type, args = {})
    link_to "##{type.parameterize}" do
      content_tag(
        :h5,
        type,
        {
          class: "popover-link",
          data: {content: popover_content(type.downcase.tr(" ", "_").to_sym)}
        }.merge(args)
      )
    end
  end
end
