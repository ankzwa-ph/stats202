class TaskStatus < ActiveHash::Base
  self.data =
    [
      { id: 1, name: :open },
      { id: 2, name: :in_progress },
      { id: 3, name: :resolved },
      { id: 4, name: :closed }
    ]
end
