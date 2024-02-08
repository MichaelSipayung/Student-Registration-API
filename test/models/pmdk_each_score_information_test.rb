require "test_helper"

class PmdkEachScoreInformationTest < ActiveSupport::TestCase
  def setup
    @pmdk_each_score =
      PmdkEachScoreInformation.new(user_id: users(:michael).id,
                                   matematika1: 90, matematika2: 80,
                                   matematika3: 89, matematika4: 90.8,
                                   matematika5: 88.9, kimia1: 98.9,
                                   kimia2: 98.9, kimia3: 88.7,
                                   kimia4: 88.5, kimia5: 88.1,
                                   fisika1: 34.9, fisika2: 99.9,
                                   fisika3: 88.9, fisika4: 99.7,
                                   fisika5: 67.7, inggris1: 88.5,
                                   inggris2: 56.8, inggris3: 77.2,
                                   inggris4: 88.1, inggris5: 99)
  end
  test 'should be valid pmdk each score information' do
    assert @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika1 score' do
    @pmdk_each_score.matematika1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_2 score' do
    @pmdk_each_score.matematika2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_3 score' do
    @pmdk_each_score.matematika3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_4 score' do
    @pmdk_each_score.matematika4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_5 score' do
    @pmdk_each_score.matematika5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_1 score' do
    @pmdk_each_score.fisika1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_2 score' do
    @pmdk_each_score.fisika2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_3 score' do
    @pmdk_each_score.fisika3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_4 score' do
    @pmdk_each_score.fisika4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_5 score' do
    @pmdk_each_score.fisika5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_1 score' do
    @pmdk_each_score.kimia1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_2 score' do
    @pmdk_each_score.kimia2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_3 score' do
    @pmdk_each_score.kimia3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_4 score' do
    @pmdk_each_score.kimia4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_5 score' do
    @pmdk_each_score.kimia5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_1 score' do
    @pmdk_each_score.inggris1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_2 score' do
    @pmdk_each_score.inggris2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_3 score' do
    @pmdk_each_score.inggris3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_4 score' do
    @pmdk_each_score.inggris4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_5 score' do
    @pmdk_each_score.inggris5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.inggris5 = nil
    assert_not @pmdk_each_score.valid?
  end

end
