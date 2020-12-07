import consumer from "./consumer";

const initChatroomCable = () => {
  const body = document.querySelector('body');
  const requests = document.getElementById('requests-container');
  const icoming = document.querySelector("#incoming-requests");
  const friend = document.querySelector("#friend-container")

  if (body) {
    // console.log("requests")
    const id = body.dataset.chatroomId;
    consumer.subscriptions.create({channel:"UserChannel",id:id},{
      received(data) {
        console.log(data)
        if(data.request){
          requests.insertAdjacentHTML('beforeend', data.notification)
          icoming.insertAdjacentHTML('beforeend', data.request);
        }

        // console.log(data.friend)
        if(data.friend){
          friend.insertAdjacentHTML('afterbegin', data.friend);
        }

        // new Notification(data["title"], body: data["body"])
      }
    })
  }
}

export { initChatroomCable };
