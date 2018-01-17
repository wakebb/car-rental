class ApprovalView
  def initialize(username, status, comment)
    @username = username
    @status = status
    @comment = comment
  end

  def getUsername
    @username
  end

  def getStatus
    @status
  end

  def getComment
    @comment
  end
end
