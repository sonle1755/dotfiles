return {
  sourceName = 'autopep8',
  command = 'autopep8',
  args = { '--experimental', '%filepath'},
  rootPatterns = {'requirements.txt', '.git'},
}
