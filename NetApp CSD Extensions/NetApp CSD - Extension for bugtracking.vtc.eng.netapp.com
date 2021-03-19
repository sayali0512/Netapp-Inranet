import re

def get_safe_meta_data_value(field):
    try:
        return document.get_meta_data_value(field)[-1]
    except Exception as e:
        return ''

task = get_safe_meta_data_value('task')
if task != "":
  mod_task = task.replace("[", "").replace(",", ";").replace("]", "")
  log(mod_task)
  document.add_meta_data({'task': mod_task})
