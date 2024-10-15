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
                        const new_key = ideas[ideas.length - 1].id + 1;
                        setIdeas([...ideas, { mId: new_key, mLikes: 666, mMessage: new_idea, }]);
                        console.log("updated");
                        changeInput("button");
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
    }
}

export default CreateIdea;