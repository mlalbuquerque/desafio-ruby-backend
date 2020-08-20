class Arquivo < ApplicationRecord
  has_one_attached :documento

  validates :sha1, uniqueness: true
  validates :sha1, presence: true

  def sha1_from_tempfile(file)
    self.sha1 = Digest::SHA1.file(file.path)
    self
  end
end
