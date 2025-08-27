#import "utility.typ": date, myName, myTitle, slide, startSlide, unipdColor
#set document(date: date, title: myTitle, author: myName)

#startSlide(
  myTitle,
  myName,
  date,
)

#include "slides/company.typ"

#include "slides/stage.typ"

#include "slides/why.typ"

#include "slides/req.typ"

#include "slides/techs.typ"

#include "slides/work_preview.typ"

#include "slides/study_waf.typ"

#include "slides/owasp.typ"

#include "slides/study_attacks.typ"

#include "slides/creation.typ"

#include "slides/conclusions.typ"

#include "slides/questions.typ"
