import { loadConfig } from './Load'

export async function sendTGMessage() {

    var { currentPoints, collectedPoints, currentMail, earnablePoints} = require('../index.js')
    
    const telegram = loadConfig().telegram

    if (!telegram.enabled) return

    let tg = {
        token: telegram.token,
        chat_id: telegram.chatid
    }

    const url = `https://api.telegram.org/bot${tg.token}/sendMessage`

    var finalPoints=currentPoints+collectedPoints

    const obj = {
        chat_id: tg.chat_id,
        text: "👤 Account: "+currentMail+"\n✨ Earnable Points: "+earnablePoints+"\n⭐️ Points earned today: "+collectedPoints+"\n💰 Total points: "+finalPoints
    };

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(obj)
    });
}
export async function sendTGLockedMessage(content: string) {

    const telegram = loadConfig().telegram

    if (!telegram.enabled) return

    let tg = {
        token: telegram.token,
        chat_id: telegram.chatid
    }

    const url = `https://api.telegram.org/bot${tg.token}/sendMessage`

    const obj = {
        chat_id: tg.chat_id,
        text: "👤 Account: "+content+"\n🚫 LOCKED"
    };

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(obj)
    });
}
