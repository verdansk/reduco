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
        console.log(data)

        icoming.insertAdjacentHTML('beforeend', data);
        // new Notification(data["title"], body: data["body"])
      }
    })
  }
}

export { initChatroomCable };
