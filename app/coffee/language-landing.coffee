class LanguageLanding extends Landing

  constructor: (articles, language) ->
    super()
    @loadFrameworks language
    $("#dont-see").on 'click', ()=>
      $node = $ jadeTemplate['propose-framework']()
      $(".frameworks").append $node
      castShadows $node

  loadArticleGroups : (articles) ->
    if articles.length == 0
      $(".main").addClass 'no-articles'
      return
    super articles

  loadFrameworks : (language) ->
    nanobox.getYaml "/yaml/frameworks/#{language}.yml", null, (yaml)=>
      if !yaml.frameworks?
        $(".main").addClass 'no-frameworks'
        return
      $node = $ jadeTemplate['language-overview/frameworks']( yaml )
      $("#frameworks-holder").append $node
      castShadows()
      if window.isLocal
        localizeLinks()

window.LanguageLanding = LanguageLanding
