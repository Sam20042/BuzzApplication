import { useState } from 'react';
import './CreateIdea.css';



function CreateIdea() {
    const [inputType, changeInput] = useState("button");
    return (
        <div className="create-idea">
            {inputType === "button" ? <CreateIdeaButton /> : <WriteIdeaBox />}
        </div>
    );

    function CreateIdeaButton() {
        return (
            <>
                <button
                    className="create-idea-button"
                    type="button"
                    onClick={() => { changeInput("write") }}
                >
                    Create Idea
                </button>
            </>
        );
    }

    function WriteIdeaBox() {
        return (
            <>
                {/* <input type="text" 
                    className="write-idea-box" 
                    textarea=
                    placeholder="Write your idea here..." 
                /> */}
                <textarea
                    className="write-idea-box"
                    rows="6"
                />
            </>
        );
    }
}

export default CreateIdea;