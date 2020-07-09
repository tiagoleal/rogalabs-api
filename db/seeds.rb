 
User.new({name: "Tiago", email: "tiago@gmail.com", password: "12345678"})
complaints = []
  50.times do | count |
    complaints.push({description: "denuncia #{ count }", latitude:'-29.705296', longitude:'-52.4145824',status:1, user: User.last})
  end
Complaint.create(complaints)


