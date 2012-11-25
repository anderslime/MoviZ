import sys

def add_search_path(path):
  return sys.path.append(path)

def get_paths():
  return dir(sys)

def python_path():
  print PYTHONPATH

def system():
  return sys
