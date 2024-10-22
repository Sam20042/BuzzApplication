import { useState } from 'react';
import './CreateIdea.css';



function CreateIdea(props) {
    const [inputType, changeInput] = useState("button");
    return (
        <div className="create-idea">
            {inputType === "button" ? <CreateIdeaButton /> : <WriteIdeaBox state={props.state} />}
        </div>
    );

    function CreateIdeaButton() {
        return (
            <>
                <button
                    className="create-idea-button"
                    type="button"
                    onClick={() => {
                        changeInput("write")
                    }}
                >
                    Create Idea
                </button>
            </>
        );
    }

    function WriteIdeaBox(props) {
        const [ideas, setIdeas] = props.state;
        const [new_idea, setNewIdea] = useState('');

        const handleChange = (event) => {
            setNewIdea(event.target.value);
        };
        return (
            <>
                <textarea
                    className="write-idea-box"
                    name="new_idea"
                    rows="10"
                    cols="5"
                    onChange={handleChange}
                    placeholder="What's your thoughts?"
                    maxLength="512"
                />
                <button
                    className="submit-idea-button"
                    type="button"
                    onClick={() => {
                        let msg = postMessage(new_idea, ideas, setIdeas);
                        //if (msg.mStatus == "ok") {
                        // setIdeas([...ideas, msg]);
                        // console.log(`Posted message ${msg}`);
                        changeInput("button");
                        //}

                        // const new_key = ideas[ideas.length - 1].id + 1;
                        // setIdeas([...ideas, { mId: new_key, mLikes: 0, mMessage: new_idea, }]);
                        // console.log("updated");
                        // changeInput("button");
                    }}
                >
                    Submit Idea
                </button>
                <button
                    className="cancel-idea-button"
                    type="button"
                    onClick={() => {
                        changeInput("button");
                    }}
                >
                    Cancel Idea
                </button>

            </>
        );


        async function postMessage(message, ideas, setIdeas) {
            let new_message;
            const doAjax = async () => {
                await fetch(`/messages`, {
                    method: 'POST',
                    body: JSON.stringify({
                        mMessage: message
                    }),
                    headers: {
                        'Content-type': 'application/json; charset=UTF-8'
                    }
                }).then((response) => {
                    // If we get an "ok" message, return the json
                    if (response.ok) {
                        return Promise.resolve(response.json());
                    }
                    // Otherwise, handle server errors with a detailed popup message
                    else {
                        window.alert(`The server replied not ok: ${response.status}\n` + response.statusText);
                    }
                    return Promise.reject(response);
                }).then((data) => {
                    console.log("Sent POST request successfully");
                    console.log(data);
                    new_message = data.mData;
                    setIdeas([...ideas, new_message]);
                    console.log(`Posted message ${new_message}`);
                }).catch((error) => {
                    console.warn('Something went wrong.', error);
                    window.alert("Unspecified error");
                });
            }

            // make the AJAX post and output value or error message to console
            doAjax().then(console.log).catch(console.log);
            return new_message;
        }
    }
}

export default CreateIdea;