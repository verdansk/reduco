import consumer from "./consumer";

const initChatroomCable = () => {
  const requests = document.getElementById('requests-container');
  const icoming = document.querySelector("#incoming-requests");
  if (requests) {
    console.log("requests")
    const id = requests.dataset.chatroomId;
    consumer.subscriptions.create({channel:"UserChannel",id:id},{
      connected() {
        console.log('connected');
      },
      received(data) {
        console.log(data.notification)
        requests.insertAdjacentHTML('beforeend', data.notification)
        icoming.insertAdjacentHTML('beforeend', data.request);
        // new Notification(data["title"], body: data["body"])
      }
    })
  }
}

export { initChatroomCable };
