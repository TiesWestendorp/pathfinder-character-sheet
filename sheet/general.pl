general_sheet(X) :-
%  gender(Gender),
%  race(Race),
  portrait(Portrait),
  phrase(general, General),
  X = [
    section(id('general'), [
      dl(General),
      img([id("portrait"), src(Portrait)])
    ])
  ].

%[
%        span([Gender, Race]),
%        Initiative,
%        div([dt("Senses"), dd(0), dt("Perception"), dd(Perception)])
%      ]

general -->
  dcg_entity(initiative, signed, title),
  dcg_entity(skill(perception), signed, title).