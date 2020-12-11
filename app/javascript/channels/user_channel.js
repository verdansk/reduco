import consumer from "./consumer";

const initChatroomCable = () => {
  const body = document.querySelector('body');
  const requests = document.getElementById('requests-container');
  const icoming = document.querySelector("#incoming-requests");
  const friend = document.querySelector("#friend-container")
  const bell = document.querySelector(".fa-bell")
  const not_value = document.querySelector(".notification-value")
  if (body) {
    // console.log("requests")
    const id = body.dataset.chatroomId;
    consumer.subscriptions.create({channel:"UserChannel",id:id},{
      received(data) {
        console.log(data)
        if(data.request){
          // requests.insertAdjacentHTML('beforeend', data.notification)
          not_value.innerHTML = data.notification;
          icoming.insertAdjacentHTML('beforeend', data.request);
          bell.classList.add("shake-rotate");
          bell.classList.add("shake-constant");
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
