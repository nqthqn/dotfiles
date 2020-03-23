package main

import (
	"fmt"
	"github.com/AlecAivazis/survey/v2"
	"os"
	"os/exec"
	"strings"
)

func main() {
	// Build list of tmux sessions
	ss, err := exec.Command("tmux", "ls", "-F", "\"#S\"").Output()
	if err != nil {
		fmt.Println(err)
	}
	opts := []string{}
	for _, o := range strings.Split(strings.TrimSuffix(string(ss), "\n"), "\n") {
		opts = append(opts, strings.Trim(o, "\""))
	}

	// Prompt user to select a tmux session
	prompt := &survey.Select{
		Message: "attach tmux session:",
		Options: opts,
		Default: "0",
	}
	sess := ""
	err = survey.AskOne(prompt, &sess)
	if err != nil {
		fmt.Println(err.Error())
		return
	}

	// Connect to selected session
	cmd := exec.Command("tmux", "attach", "-t", sess)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	fmt.Println(cmd.String())
	if err != nil {
		fmt.Println(err)
	}
}
