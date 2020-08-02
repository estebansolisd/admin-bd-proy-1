import axios from "axios";
export async function sendAPIRequest(url, method, parameters = {}) {
    try {
        return (
            await axios({
                method,
                timeout: 0,
                url,
                data: parameters
            })
        ).data;
    } catch (error) {
        console.error(error);
    }
}
